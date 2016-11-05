---
layout: sidebar
styleguide: true
---

# Footer

## Explanation

The site footer is a primary form of providing a consistent look and feel across the sites
listed in the scope for this style guide. By having a common footer across all sites, it is
an immediate visual cue to users that they on one of the business.gov.au related sites.

In a mobile view the footer wraps into one column and the business.gov.au logo is visible, at 
larger screen widths, the footer links move into a row and the logo is replaced by text. See the
HTML section on this page for more details

Business.gov.au has a format for the footer that may or not apply to all sites, but if possible
try and replicate its appearance.

*Note*: The business.gov.au website updates its footer every now and then. For this reason 
copying the straight links from the menu may work for a short time, but will need to be monitored.
We will also try our best to notify teams of changes to the footer.

In the future we will look at adding a service to allow sites to pull in our footer.

## Example

### Mobile First

<img style="max-width: 50%" src="{{site.baseurl}}/images/bga-mobile-first-footer.png" alt="Image of the business.gov.au mobile footer" />

### Medium widths and up

![Image of the business.gov.au medium width and up footer]({{site.baseurl}}/images/bga-medium-up-footer.png)

## HTML

{% highlight html %}
<footer class="hide-on-print">
<div class="navigation-footer-legal">
  <div class="row">
    <div class="columns">
      <ul class="legal">
        <li class="small-only-12"><a href="/about">About</a></li>
        <li class="small-only-12"><a href="/for-government">For Government</a></li>
        <li class="small-only-12"><a href="/legal-notices">Legal notices</a></li>
        <li class="small-only-12"><a href="/about/accessibility">Accessibility</a></li>
        <li class="small-only-12"><a href="/about/other-languages">Other languages</a></li>
        <li class="small-only-12"><a href="tel:132846">13 28 46</a></li>
        <li class="small-only-12"><a href="/contact-us">Contact us</a></li>
      </ul>
      <ul class="social">
        <li><a class="facebook" href="https://www.facebook.com/business.gov.au"><span class="fa fa-facebook-square"></span><span class="label show-for-sr">Facebook</span></a></li>
        <li><a class="twitter" href="https://twitter.com/business_gov_au"><span class="fa fa-twitter-square"></span><span class="label show-for-sr">Twitter</span></a>li>
        <li><a class="linkedin" href="https://www.linkedin.com/company/department-of-innovation-industry-science-and-research"><span class="fa fa-linkedin-square"></span><span class="label show-for-sr">LinkedIn</span></a></li>
        <li><a class="youtube" href="https://www.youtube.com/user/BusinessGovAu"><span class="fa fa-youtube-square"></span><span class="label show-for-sr">Youtube</span></a></li>
      </ul>
      <div class="bga-ftr-logo">
        <a href="/"><strong>business</strong>.gov.au</a>
      </div>
      <a href="/" class="logo">
        <img src="/Areas/Business/Assets/App/Images/bga_logo_footer.png" alt="Business.gov.au logo">
      </a>
    </div>
  </div>
</div>
</footer>
{% endhighlight %}

## CSS

### Mobile first

At screen widths up to 640px the footer has a 6px border on the top and 4.5rem of padding-bottom.
The background-color is #214D94.
<!-- TODO: this is inconsistent with the style guide why is the color this and not #254f90??? -->

{% highlight css %}
.navigation-footer-links { border-top: 6px solid #214d94; }
.navigation-footer-legal { background: #214d94; padding-bottom: 4.5rem; }
{% endhighlight %}

The logo is `bga_logo_footer.png`, it has a min-width of 265px.

{% highlight css %}
.navigation-footer-legal .logo img {
    width: 60%;
    min-width: 265px;
}
{% endhighlight %}

### Medium-up

At screen widths > 640px the footer changes some part of the layout. The logo changes and there is
1.5rem of padding added to the top.

The logo changes from image to text, `<strong>business</strong>.gov.au`. The font family is still
'Open Sans'.

{% highlight css %}
.navigation-footer-legal { padding-top: 1.5rem; }
{% endhighlight %}