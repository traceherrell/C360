<script >
    import "$lib/theme.scss"
    import Header from "./Header.svelte";
</script>

<main class="container">
    <Header/>
    <slot/> 
</main>