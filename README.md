# Webship Portal

The Webship.co portal site template: a site to manage software, with documentation, products and releases,
a newsletter and social sharing, in [Webtheme](https://www.drupal.org/project/webtheme), the theme with the
Webship.co colors and design.

Maintained by [Webship](https://www.drupal.org/project/webship). Built on top of Drupal and
[Display Builder](https://www.drupal.org/project/display_builder). No Layout Builder displays and no Drupal
Canvas.

The site template works on its own: it applies the Web Admin, Web SEO, Web Security, Web Development, Web Page,
Web Assets, Web Editor, Web Config, Web Doc, Web Releases and Web Newsletter default recipes, the Web Dashboard
recipe and core recipes, never another site template.

![Webship Portal](screenshot.webp)

## Install

With the [Website](https://www.drupal.org/project/website) project template and DDEV:

```shell
composer create-project drupal/website my_site
cd my_site
ddev config --project-type=drupal --docroot=web
ddev start
ddev composer require drupal/webship_portal
ddev drush site:install recipes/webship_portal -y
ddev launch
```

The [Webship](https://www.drupal.org/project/webship) installer lists the site templates: choose Webship Portal.

On an installed site, apply it as a recipe:

```shell
ddev composer require drupal/webship_portal
ddev drush recipe recipes/webship_portal
```

## What you get

- **Content types**: Webpage, with the media library (images, documents, audio, video) of Web Assets.
- **Webtheme** as the default theme, with its blocks placed: site branding, main and account menus,
  breadcrumbs, page title, local tasks, footer and social media menus.
- [Web Doc](https://www.drupal.org/project/webdoc): documentation book pages at `/docs`.
- [Web Releases](https://www.drupal.org/project/webreleases): products and release notes, at `/products`.
- [Web Newsletter](https://www.drupal.org/project/webnewsletter): a newsletter subscription webform.
- [Webshare](https://www.drupal.org/project/webshare): social sharing buttons.
- **Contact webform** with anti-spam protection, at `/contact`.
- **Administration**: [Web Admin](https://www.drupal.org/project/webadmin) with Gin and its toolbar, Coffee,
  Project Browser and automatic updates; the Webmaster and Editorial default dashboards of the
  [Web Dashboard recipe](https://www.drupal.org/project/webdash), built with Display Builder.
- **SEO and security**: [Web SEO](https://www.drupal.org/project/webseo) with breadcrumbs, redirects, path
  aliases, metatags and the XML sitemap; [Web Security](https://www.drupal.org/project/websecurity) with anti-spam
  protection and login by email or username.
- **Editing and configuration**: the editor and configuration management features of Webship.

## Requirements

- Drupal 11.4 or later.
- PHP 8.3 or later.
- Composer 2.
