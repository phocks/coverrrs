<script lang="ts">
  import type { PageData } from "./$types";

  import { customAlphabet } from "nanoid";
  import { nolookalikesSafe } from "nanoid-dictionary";

  const getNanoId = customAlphabet(nolookalikesSafe, 21);
  console.log(getNanoId());

  // --- Constants ---
  const IMG_CDN_BASE = "https://coverrrs-img.global.ssl.fastly.net";

  type Props = { data: PageData };
  let { data }: Props = $props();
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
          src="{IMG_CDN_BASE}/v1/images/coverrrs/{cover.imageId}"
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
    // display: inline-block;

    img {
      // border-radius: 32px;
      max-width: 100%;
      width: 500px;
      display: block;
    }
  }
</style>
