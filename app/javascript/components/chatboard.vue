<template>
    <ul>
        <template v-for="(comment, index) in comments">
            <li :key="index">
                <img :src="comment.avatar" />
                <div>
                    <p>
                        {{
                        comment.content
                        }}
                    </p>
                    <p>{{ comment.createdAt.toDate().toLocaleString() }}</p>
                    <p>
                        <button @click="deleteComment(comment.id)" small>delete</button>
                    </p>
                </div>
            </li>
        </template>
    </ul>
</template>

<script lang="ts">
  import { db } from "../plugins/firebase";

  export default {
    name: "ChatBoard",
    data: () => ({
      comments: []
    }),
    firestore() {
      return {
        comments: db.collection("comments").orderBy("createdAt")
      };
    },
    methods: {
      deleteComment(id) {
        if (!confirm("Are you sure?")) {
          return;
        }
        db.collection("comments")
          .doc(id)
          .delete();
      }
    }
  };
</script>
