<!-- bootstrap notes -->
<!-- Box-sizing
For more straightforward sizing in CSS, we switch the global box-sizing value from content-box to border-box. This ensures padding does not affect the final computed width of an element, but it can cause problems with some third party software like Google Maps and Google Custom Search Engine.

On the rare occasion you need to override it, use something like the following:

Copy
.selector-for-some-widget {
  box-sizing: content-box;
}
With the above snippet, nested elements—including generated content via ::before and ::after—will all inherit the specified box-sizing for that .selector-for-some-widget.

Learn more about box model and sizing at CSS Tricks. -->