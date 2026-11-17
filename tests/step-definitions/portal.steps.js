/**
 * @file
 * Custom webship-js step definitions for the Webship Portal site template.
 */

const assert = require("node:assert");
const { Then } = require("@cucumber/cucumber");

/**
 * Example: Then the links of "header .uk-navbar-nav" should be in this order:
 */
Then(
  /^the links of "([^"]*)" should be in this order:$/,
  async function (selector, table) {
    const expected = table.raw().map((row) => row[0]);
    const links = await this.page
      .locator(selector)
      .first()
      .locator(":scope > li > a")
      .allTextContents();
    assert.deepStrictEqual(
      // The label of a link that leaves the site ends with a hidden note.
      links.map((text) => text.replace("(link is external)", "").trim()),
      expected,
    );
  },
);

/**
 * Example: Then the page should have 1 "footer" landmark
 */
Then(
  /^the page should have (\d+) "(header|footer|main|nav)" landmarks?$/,
  async function (count, tag) {
    const selector =
      tag === "header" || tag === "footer"
        ? `body ${tag}:not(article ${tag}, section ${tag}, main ${tag})`
        : tag;
    assert.strictEqual(await this.page.locator(selector).count(), Number(count));
  },
);

/**
 * Example: Then the page should not scroll horizontally
 */
Then(/^the page should not scroll horizontally$/, async function () {
  const overflow = await this.page.evaluate(
    () =>
      document.documentElement.scrollWidth -
      document.documentElement.clientWidth,
  );
  assert.ok(overflow <= 1, `The page is ${overflow}px wider than the window.`);
});

/**
 * Checks that the page does not talk about site templates: the portal is about
 * automated functional testing.
 *
 * Example: Then the page should not talk about site templates
 */
Then(
  /^the page should not talk about site templates$/,
  async function () {
    const text = (await this.page.locator("body").innerText()).toLowerCase();
    ["site template", "installer", "website starter", "webship starter"].forEach(
      (words) => {
        assert.ok(!text.includes(words), `The page mentions "${words}".`);
      },
    );
  },
);

/**
 * Example: Then the hero headline should fit its card
 */
Then(/^the hero headline should fit its card$/, async function () {
  const overflow = await this.page.evaluate(() => {
    const heading = document.querySelector(".uk-section-primary h1");
    const cell = heading.parentElement.getBoundingClientRect();
    const box = heading.getBoundingClientRect();
    return Math.max(box.right - cell.right, cell.left - box.left, heading.scrollWidth - heading.clientWidth);
  });
  assert.ok(overflow <= 1, `The headline overflows its card by ${overflow}px.`);
});
