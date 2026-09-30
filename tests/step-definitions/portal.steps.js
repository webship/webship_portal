/**
 * @file
 * Custom webship-js step definitions for the Webship Portal site template.
 */

const assert = require("node:assert");
const { execSync } = require("node:child_process");
const { homedir } = require("node:os");
const path = require("node:path");
const { Given, When, Then } = require("@cucumber/cucumber");

const PROJECT_DIR =
  process.env.DRUPAL_PROJECT_DIR ||
  path.join(homedir(), "workspace/test/webship-portal");
const DRUSH = process.env.DRUSH || "ddev drush";

/**
 * Runs a Drush command on the test site and returns its output.
 */
function drush(command) {
  return execSync(`${DRUSH} ${command}`, {
    cwd: PROJECT_DIR,
    encoding: "utf8",
    stdio: ["ignore", "pipe", "pipe"],
  }).trim();
}

/**
 * Logs in with a one-time login link as a test user that has one role.
 *
 * The user is created on first use. No password is stored anywhere.
 *
 * Example: Given I am logged in as a user with the "content_editor" role
 */
Given(
  /^I am logged in as a user with the "([a-z_]+)" role$/,
  { timeout: 180000 },
  async function (role) {
    const name = `test_${role}`;
    try {
      drush(`user:information ${name} --fields=uid`);
    } catch {
      drush(`user:create ${name} --mail=${name}@example.com`);
      drush(`user:role:add ${role} ${name}`);
    }
    const link = drush(`user:login --name=${name} --no-browser`)
      .split("\n")
      .pop();
    const target = new URL(link);
    await this.page.goto(
      `${this.parameters.launchUrl}${target.pathname}${target.search}`,
    );
    await this.page.waitForURL((url) => /\/user\/\d+/.test(url.pathname));
  },
);

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
 * Example: Then the page should not present Webship as a provider of site templates
 */
Then(
  /^the page should not present Webship as a provider of site templates$/,
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

/**
 * Opens the edit form of the content at a path alias.
 *
 * Example: When I go to the edit form of "/about-us"
 */
When(/^I go to the edit form of "([^"]*)"$/, async function (alias) {
  const system = drush(
    `php:eval ${JSON.stringify(`print \\Drupal::service("path_alias.manager")->getPathByAlias("${alias}");`)}`,
  );
  await this.page.goto(`${this.parameters.launchUrl}${system}/edit`, {
    waitUntil: "domcontentloaded",
  });
});
