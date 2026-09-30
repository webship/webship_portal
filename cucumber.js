/**
 * @file
 * Webship-js (Cucumber-js + Playwright) configuration for Webship Portal.
 *
 * Environment:
 * - LAUNCH_URL: a site installed from this site template
 *   (default https://webship-portal.ddev.site).
 * - DRUSH: command running Drush for that site, used by the custom steps
 *   (default "ddev drush", run from DRUPAL_PROJECT_DIR).
 * - DRUPAL_PROJECT_DIR: the Drupal project directory
 *   (default ~/workspace/test/webship-portal).
 */
module.exports = {
  default: {
    timeout: 60000,
    requireModule: ["tsx/cjs"],
    require: [
      "node_modules/webship-js/tests/step-definitions/**/*.js",
      "tests/step-definitions/**/*.js",
    ],
    paths: ["tests/features/**/*.feature"],
    format: [
      "@cucumber/pretty-formatter",
      "json:tests/reports/cucumber_report.json",
    ],
    worldParameters: {
      launchUrl: process.env.LAUNCH_URL || "https://webship-portal.ddev.site",
      minWaitTime: {
        page: 300,
        before_scenario: 0,
        after_scenario: 0,
        before_step: 0,
        after_step: 0,
      },
      selectors: {
        css: {},
        xpath: {},
        filesPath: "./tests/selectors/",
        files: [],
        offset: 60,
        breakpoints: {
          xs: { width: 390, height: 800 },
          m: { width: 960, height: 900 },
          l: { width: 1440, height: 900, default: true },
        },
      },
      screenshot: {
        dir: "./tests/screenshots",
        purge: false,
        onFailed: true,
        onEveryStep: false,
        alwaysFullscreen: false,
        failedPrefix: "failed_",
        filenamePattern: "{datetime}.{feature_file}.feature_{step_line}.{ext}",
        filenamePatternFailed:
          "{failed_prefix}{datetime}.{feature_file}.feature_{step_line}.{ext}",
        infoTypes: "",
      },
    },
  },
};
