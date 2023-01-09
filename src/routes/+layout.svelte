<script>
	import '$lib/theme.scss';
	import Header from './Header.svelte';
	import { page } from '$app/stores';
</script>

<main>
	<Header />
	<div class="container">
		<slot />
	</div>
</main>
