<template>
    <div>
        <form v-on:submit.prevent="addComment">
            <label for="new-comment">Add a comment</label>
            <input v-model="inputComment" id="new-comment" label="comment" />
            <input type="submit" />
        </form>
    </div>
</template>

<script lang="ts">
  import { db } from "../plugins/firebase";

  export default {
    name: "CreateForm",
    data: () => ({
      inputComment: "",
      valid: true,
      commentRules: [v => !!v || "comment is required"],
      displayForm: false
    }),
    methods: {
      addComment() {
        const now = new Date();
        db.collection("comments").add({
          content: this.inputComment,
          avatar:
            "https://picsum.photos/50?image=" +
            (Math.floor(Math.random() * 400) + 1),
          createdAt: now
        });
        this.clear();
      },
      clear() {
        this.$refs.form.reset();
      },
    }
  };
</script>
