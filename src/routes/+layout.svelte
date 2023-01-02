<script>
	import '$lib/theme.scss';
	import Header from './Header.svelte';
</script>

<main>
	<Header />
	<div class="container">
		<slot />
	</div>
</main>
