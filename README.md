#  JLP Tech Test

Thank you for taking the time to review my tech test

To run the project please: 
* add the file JLPTechTest/Keys.plist with a key of "API_KEY" and a value of `AIzaSyDD_6O5gUgC4tRW5f9kxC0_76XRC8W7_mI`
* resolve the packages

Here are some thoughts about what I've done/improvements that could be made:

* The design was inconsistent between screens in some areas e.g. the position of the Product Code. I do not believe this is intentional. I would clarify this with the designer.
* In the detail page of a product the title is positioned to be the navigation bar's title. This doesn't seem like an appropriate place to put it considering the length of products' titles. I'd either reposition it below the images, or investigate whether a shorter title could be provided from the API, I don't belive there currently is.
* Slight inconsistency between data provided for the product specification by the API against what's displayed on the design e.g. YES instead of Yes. Considering that the it looks like the data from the API is ready to be consumed by clients I believe this is a mistake in the design. 
* On the product grid screen the navigation bar is suffixed with a number, I assume this is the number of pages of results. I don't think the title is an appropriate place to display this information. I chose to display the number of results, but I'd clarify what the purpose of that number is, and whether there's a better way to display it. 
* I didn't accurately follow the color scheme in the designs. I opted to use the default system colors as they support both light and dark mode. If I were to work on this more I'd add Color Assets that more accurately reflect the design, and consult the designer about what these colors should be in dark mode.
* I didn't have accurate measurements of the spacing between views from the designs since it was just a screenshot, so the spacing might be slightly different from what the designer intended.
* I deviated from the design's "Read More" button. The one I added felt more intuitive and saved building a new screen. I'm not sure if that's what the design intended but it seemed to be so from the disclosure indicator. 
* I added a simple UI test but would test more functionality with more time, and also remove the dependence of UI tests on the network by providing fake data.
* All the products from the search had a currency of GBP, I did not write any code to handle other currencies.
* I used a dependency for Image Caching to speed up development.
* I used a dependency for rendering HTML, it has some quirks, does not support dynamic type, and prevented me from animating extending its length, but saved in development time. 
