---
layout: sidebar
styleguide: true
---

# Links and Buttons

On this page:

- [Explanation](#explanation)
- [Links](#links)
- [Buttons](#buttons)

<div id="explanation"></div>

## Explanation

In different places on the web it is important to include links and buttons,
this page is intended to provide some guidance around when to include or use
links and buttons and in what situations one is preferred over the other.

It is important to note that links are `<a>` tags and can sometimes be styled to 
look like buttons. Buttons however refer to `<button>` tags `<input>` tags with a 
type of `submit`, `search`, `reset` or `button`.

### Where to use...

This section is not intended to be a hard set of rules. Recognising that 
not all situations are the same or can be accounted for, this is simply a guide
to try and get some consistency across the site. As with anything in web design, 
if you choose a design pattern, then stick with it. If you are unsure as to a
certain situation, that is not included on this page, then see if you can find 
it in use on a production site, and make an effort to follow that pattern.

Buttons are primarily used when dealing with forms and actions, links are primarily used
for navigation. Also consider your use of the appearance of links and buttons when trying
to draw attention to the element.

#### Links

- To navigate to different sections on the page, like in a single page
scrolling website
- To navigate to other pages within the same site
- To navigate to between separate websites using the 'href' attribute
- Links are also used when information is provided in some other window, layer or popup.
E.g. A help window that is available while filling out a form.
- Elements like 'next', 'proceed' and 'continue' can be used as links when it takes the user
to another webpage, for example, in pagination.

#### Buttons

- Buttons are used when an action is associated with the element, for example,
'search', 'submit', 'cancel' and 'save'.
- Elements like 'next', 'proceed' and 'continue' can be buttons when they are part of a 
process to collect form information, for example, a registration or checkout flow.

### Exceptions

As mentioned earlier, these rules are not set in stone and there may be situations where
these guidelines do not make sense, or an alternative option would be better.

<div id="links"></div>

## Links

When using links as inline navigation, it is important to ensure that the link text is
descriptive and meaningful. This is for accessibility reasons, as a screen reader will
often read the link text to the user. A poor example of link text would be [click here](#)
as a page full of 'click here's is not as useful as [find more information on Zurb Foundation](#).

### HTML

{% highlight html %}
<a href="/linkto/somewhere">This is a link to somewhere</a>
{% endhighlight %}

### CSS

Anchor tags have a color, and a `text-decoration: underline` style.

{% highlight scss %}
$anchor-font-color: #16306C;
{% endhighlight %}

### External Links

Links that go to external links, have an additional style to add a an icon indicating
that they lead to an external site.

See this example [Google.com](http://www.google.com.au)

{% highlight scss %}
a:not([href*="mailto"])[href*="//"] {
  &:after {
    padding: 0.25em;
    display: inline-block;
    content: $fa-var-external-link; // "\f08e"
    font: normal normal normal 14px/1 FontAwesome;
  }
}
{% endhighlight %}

<div id="buttons"></div>

## Buttons

<button class="call-to-action">Example</button>

Business.gov.au has limited need for buttones and as such does not have the most comprehensive,
guidance around button styles and usage. BGA uses square cornered buttons, that is they 
have no `border-radius`.

### HTML

{% highlight html %}
<button>Example</button>
{% endhighlight %}

### CSS/SCSS

{% highlight scss %}
{
opacity: 0.9;
border: none;
background-color: $bga-primary-color;
color: $white;
text-decoration: none;
line-height: $bga-rhythm-unit;
padding: ($bga-rhythym-unit / 4) 2em;
margin-bottom: $bga-rhythym-unit;
border-radius: 0;
display: inline-block;
&:hover {
    opacity: 1;
  }
}
{% endhighlight %}




