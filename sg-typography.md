---
layout: sidebar
styleguide: true
---

# Typography

On this page:

- [Fonts](#fonts)
- [Heading Levels and Paragraph](#heading-levels)

<div id="fonts"></div>

## Fonts

Business.gov.au uses 'Open Sans' as its default font, with a fallback to 'Sans Serif'.

This is imported as a google font with 
{% highlight html %}
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,300,400,600,700">
{% endhighlight %} 

Available font weights in both regular and italics are 300, 400, 600, 700.

BGA uses this scss variable: `$bga-font-family-sans-serif: 'Open Sans', sans-serif;`

<div id="heading-levels"></div>

## Heading Levels and Paragraph

Business.gov.au has base level styles for heading levels, and then individual overrides
for heading use in other parts of the site.

<table>
  <thead>
    <tr>
      <th width="400">Heading Level</th>
      <th>Base Styles</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><h1>Heading Level 1</h1></td>
      <td><p>Size 32px (2rem), Font-weight 600</p></td>
    </tr>
    <tr>
      <td><h2>Heading Level 2</h2></td>
      <td><p>Size 24px (1.5rem), Font-weight 600</p></td>
    </tr>
    <tr>
      <td><h3>Heading Level 3</h3></td>
      <td><p>Size 20px (1.25rem), Font-weight 600</p></td>
    </tr>
    <tr>
      <td><h4>Heading Level 4</h4></td>
      <td><p>Size 16px (100%), Font-weight 600</p></td>
    </tr>
    <tr>
      <td><h5>Heading Level 5</h5></td>
      <td><p>Size 16px (100%), Font-weight 400</p></td>
    </tr>
    <tr>
      <td><h6>Heading Level 6</h6></td>
      <td><p>Size 15.2px (95%), Font-weight 400</p></td>
    </tr>
    <tr>
      <td><p>Paragraph</p></td>
      <td><p>Size 16px (1rem), Font-weight 400</p></td>
    </tr>
  </tbody>
</table>