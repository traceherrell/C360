<script>
	import Header from './Header.svelte';
	import { page } from '$app/stores';
</script>

<main>
	<div class="header">
		<Header />
	</div>

	<div class="main">
		<slot />
	</div>
</main>

<style>
	.header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 1;
	}
	.main {
		max-width: 800px;
		margin-top: 50px;

		padding: 1em;
	}
</style>
