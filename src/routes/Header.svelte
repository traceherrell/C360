<script>
	import { MenuIcon, UserIcon } from 'svelte-feather-icons';

	import RedHatLogo from '$lib/RedHatLogo.svelte';
</script>

<nav>
	<ul>
		<li>
			<RedHatLogo />
			<a href="/"><strong>Consultant 360 Feedback</strong></a>
		</li>
	</ul>
	<ul>
		<li><a href="/admin">Admin</a></li>
		<li><a href="/surveys">Surveys</a></li>
		<li><a href="/profile">Profile</a></li>
	</ul>
	<ul>
		<li><UserIcon /></li>
	</ul>
</nav>

<style>
	nav {
		background-color: #212121;
		box-shadow: 0 4px 2px -2px rgba(0, 0, 0, 0.2);
		padding: 1em;
	}
	li {
		padding: 0 1em 0 1em;
		color: #fff;
	}
	li strong {
		font-size: 1.1em;
		padding-left: 1em;
		color: #fff;
	}
</style>
