<template>
    <div id="app">
        <ul>
            <li>
                <ChatBoard/>
            </li>
            <li>
                <ChatForm/>
            </li>
        </ul>
    </div>
</template>

<script lang="ts">
    import ChatBoard from "./components/chatboard";
    import ChatForm from "./components/form";

    export default {
        name: "App",
        components: {
            ChatBoard,
            ChatForm
        }
    };
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }
</style>