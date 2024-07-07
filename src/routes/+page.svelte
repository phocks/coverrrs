<script lang="ts">
	import type { PageData } from './$types';

	import { customAlphabet } from 'nanoid';
	import { nolookalikesSafe } from 'nanoid-dictionary';

	const getNanoId = customAlphabet(nolookalikesSafe, 21);

	console.log(getNanoId());

	export let data: PageData;

	$: console.log(data.feed);
</script>

<svelte:head>
	<title>Coverrrs / Some interesting book covers etc.</title>
	<meta name="description" content="Some interesting book covers." />
</svelte:head>

<section>
	<!-- <img
		alt="Cover of 'When I Sing Mountains Dance' book wth lots of plants around it."
		src="https://img.coverrrs.com/v1/images/testing/217a3075-61ff-488d-a5fb-3377192da0bf"
		width="500"
	/> -->

	{#each data.feed as cover}
		<img
			alt={cover.title}
			src="https://img.coverrrs.com/v1/images/testing/{cover.imageId}"
			width="500"
		/>
	{/each}
</section>

<style lang="scss">
	section {
		// display: flex;
		// flex-direction: column;
		// justify-content: center;
		// align-items: center;
		// flex: 1;
	}

	img {
		// border-radius: 32px;
		// max-width: 100%;
	}
</style>
