# Webship Portal

The Webship.co portal site template: the [Webship Starter](https://www.drupal.org/project/webship_starter) with
[Webtheme](https://www.drupal.org/project/webtheme), a theme generated from
[UI Suite UIkit](https://www.drupal.org/project/ui_suite_uikit) with the Webship.co colors and design.

Maintained by [Webship](https://www.drupal.org/project/webship). Built with single directory components (SDC),
[UIkit](https://getuikit.com) and [HTMX](https://htmx.org), on top of Drupal and
[Display Builder](https://www.drupal.org/project/display_builder).

## Install

With the [Website](https://www.drupal.org/project/website) project template and DDEV:

```shell
composer create-project drupal/website my_site
cd my_site
ddev composer require drupal/webship_portal
ddev start
ddev launch
```

The [Webship](https://www.drupal.org/project/webship) installer lists the site templates: choose Webship Portal.
