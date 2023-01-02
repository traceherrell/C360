<script>
	import { MenuIcon, UserIcon } from 'svelte-feather-icons';

	import RedHatLogo from '$lib/RedHatLogo.svelte';
</script>

<nav>
	<ul>
		<li>
			<RedHatLogo />
			<strong>Consultant 360 Feedback</strong>
		</li>
	</ul>
	<!-- <ul>
		<li><strong>C360</strong></li>
	</ul> -->
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
	}
</style>
