---
layout: sidebar
styleguide: true
---

# Header

## Explanation

The site header is a primary form of providing a consistent look and feel across the sites
listed in the scope for this style guide. By having a common header across all sites, it is
an immediate visual cue to users that they on one of the business.gov.au related sites.

Business.gov.au uses the header space to also include a search dropdown and a megamenu, not
all sites will use this same menu. It is recommended that if you are using a megamenu, that
you try and best replicate the [megamenu styles]({{site.baseurl}}/sg-megamenu.html) in this guide.

*Note*: The business.gov.au website uses a dynamically updated menu and its containing links
are subject to change. For this reason copying the straight links from the menu is not recommended,
however, using the structure is suggested.

In the future we will look at adding a service to allow sites to pull in our dynamically created
megamenu.

## Example

![Image of the business.gov.au header]({{site.baseurl}}/images/bga-header.png)

## HTML

{% highlight html %}
<nav class="business-navigation-mega">
  <div class="MegaMenu" role="menubar">
  </div>
</nav>
{% endhighlight %}

## CSS

The top blue and yellow ribbon effect is achieved by placing a top border on the top of
`.business-navigation-mega` and another border at the top of `.MegaMenu`.

*Note*: This is the compiled css, where possible use SCSS variables.

{% highlight css %}
.business-navigation-mega { border-top: 29px solid #254F90; }
{% endhighlight %}

{% highlight css %}
.MegaMenu { border-top: .25rem solid #E5B13D; }
{% endhighlight %}