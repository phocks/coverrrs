<script lang="ts">
  import type { PageData } from "./$types";

  import { customAlphabet } from "nanoid";
  import { nolookalikesSafe } from "nanoid-dictionary";

  const getNanoId = customAlphabet(nolookalikesSafe, 21);

  console.log(getNanoId());

  export let data: PageData;
</script>

<svelte:head>
  <title>Coverrrs / Some interesting book covers etc.</title>
  <meta name="description" content="Some interesting book covers." />
</svelte:head>

<section>
  <div class="cover-container">
    {#each data.feed as cover}
      <div class="cover">
        <img
          alt={cover.title}
          src="https://img.coverrrs.com/v1/images/coverrrs/{cover.imageId}"
          width="500"
        />
      </div>
    {/each}
  </div>
</section>

<style lang="scss">
  section {
    /* display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    flex: 1; */
  }

  .cover-container {
    /* disp lay: flex; */
    overflow-x: auto; /* Enable horizontal scrolling */
    white-space: nowrap; /* Prevent wrapping */
  }

  .cover {
    display: inline-block;

    img {
      // border-radius: 32px;
      // max-width: 100%;
      max-height: 700px;
      width: auto;
    }
  }
</style>
