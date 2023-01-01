
    <script>
        let myButton = 1;
        let countUp = () => [
            myButton++
        ]
    
    </script>   
 <h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
<button on:click={countUp}>text {myButton}</button>

