<script>
	import { page } from '$app/stores';
	import RedHatLogo from '$lib/RedHatLogo.svelte';
</script>

<nav>
	<RedHatLogo />
	<a href="/"><strong>Consultant 360 Feedback</strong></a>

	<a
		class={$page.url.pathname.includes('admin') ? 'button primary' : 'button secondary'}
		href="/admin">Admin</a
	>
	<a
		class={$page.url.pathname.includes('surveys') ? 'button primary' : 'button secondary'}
		href="/surveys">Surveys</a
	>
	<a
		class={$page.url.pathname.includes('profile') ? 'button primary' : 'button secondary'}
		href="/profile">Profile</a
	>
	<div class="max" />
	<button class="circle transparent">
		<i>login</i>
	</button>
</nav>

<style>
	nav {
		background-color: #212121;
		box-shadow: 0 4px 2px -2px rgba(0, 0, 0, 0.2);
		padding: 1em;
		color: #fff;
	}
	strong {
		font-size: 1.5em;
	}
</style>
