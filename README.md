# Real-madrid-2023-2024
A Real Madrid 2023/2024 beautiful Animation Concept SwiftUI

# Animation

https://github.com/javff/Real-madrid-2023-2024/assets/18092648/adce97ab-5689-4d12-ab17-3134c385a4b8

# Process

- [Drawing a Real Madrid Logo](#Drawing-a-Real-Madrid-Logo)
- [Create a Sponsor Logo](#Create-a-Sponsor-Logo)
- [Create a Content Shirt](#Create-a-Content-Shirt)
- [Create a complete Shirt](#Create-a-complete-Shirt)
- [Create a Buy button](#Create-a-Buy-button)
- [Putting all the pieces together](#Putting-all-the-pieces-together)


# Drawing a Real Madrid Logo

The main idea is to use Bézier curves to draw the Real Madrid logo. We will follow the following process:

1. Obtain the Real Madrid logo in SVG format.
2. Convert the SVG to Bézier curves. For this, we will use the following website: [https://swiftvg.mike-engel.com/](https://swiftvg.mike-engel.com/)
3. Create shapes using the Bézier curves obtained in the previous step.
4. In a `ZStack`, overlay all the shapes that form the Real Madrid logo.
5. Add animations to the shapes.

**Pro tip**: play with the modifiers `trim`, `stroke`, and `fill` to achieve the desired effect.

# Create a Sponsor Logo

To create the "Emirates Fly Better" sponsor logo, follow these steps:

1. Obtain the appropriate typography for the logo.
2. Create a view that includes a `VStack` container.
3. Inside the `VStack`, add `Text` elements with the required words.

**Pro tip**: By doing it this way, we will have greater flexibility if we want to modify the phrase or adjust its size.

# Create a Content Shirt

Now, we will create a view that contains all the content for the t-shirt. It will have 3 main elements: the sponsor logo, the Real Madrid logo, and the Adidas logo.
For the sponsor logo and the Real Madrid logo, we will use the previously created views. For the Adidas logo, we will use a PNG image.

To create the t-shirt view with the sponsor, Real Madrid, and Adidas logos, follow these steps:

1. Create a `GeometryReader` container.
2. Place the Real Madrid logo in the center of the screen and wait for the drawing animation to complete.
3. Use the `position` modifier and the `scaleEffect` modifier to move the logo to the top-right corner of the screen and reduce its size.
4. Once the Real Madrid logo is in position, make the sponsor and Adidas logos visible using modifiers like `opacity` or `hidden`.

**Pro tip**: By keeping the animation duration and transition values in variables, you can easily synchronize animations across multiple elements.

**Pro tip**: Create a structure that contains the mentioned values and pass them through the constructor. This enables you to experiment with different values more easily, whether in previews or higher-level views.

**Pro tip**: For the ZoomOut effect of the Real Madrid logo, utilize `keyframeAnimator` to have finer control over the animation.


# Create a complete Shirt

To create the complete t-shirt, we will use the previously created ShirtContentView view to represent the t-shirt's content. To display the t-shirt's border, we will use a PNG image.

The strategy will be similar to the previous views. Within a GeometryReader, we will instantiate a ShirtContentView and an Image representing the borders. Initially, the Image will be hidden.

1. Create a `GeometryReader` container.
2. Instantiate a `ShirtContentView` within the `GeometryReader`.
3. Add an `Image` representing the t-shirt's borders, initially hidden.
4. Allow the appear animation of the `ShirtContentView` to complete.
5. Apply a `scaleEffect` to the `ShirtContentView` and simultaneously apply the same effect to the `Image`, making it visible.

By following these steps, you can create a dynamic t-shirt view with the desired animations and effects, including the ZoomOut effect for the content and the visibility of the t-shirt's borders.

**Pro tip**: To achieve a ZoomOut effect that you find appealing, experiment with adjusting different values using the `scaleEffect` modifier.

# Create a Buy button

To create the button view, follow these steps:

1. Use `VStack` and `HStack` to create the desired button layout.
2. Add a `Button` with the required content and style within the structure.
3. Add Animations.

**Pro tip**: Use the `phaseAnimator` to achieve the desired effect on the button. Experiment with different configurations and adjustments until you achieve the visually appealing result you desire.

# Putting all the pieces together

Lorem it sum lorem it sum Lorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sumLorem it sum lorem it sum
