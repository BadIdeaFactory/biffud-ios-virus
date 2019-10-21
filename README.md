# BIFFUD iOS Virus

This very appropriately named project is a generic iOS wrapper (bacteriophage) capable of injecting HTML (RNA) into your iOS device (host cell).

Here is an architecture diagram.

![architecture](https://user-images.githubusercontent.com/208884/66493299-ce0bb580-ea83-11e9-9489-d394b0622bbf.png)

## Application types

There are two types of web application that can be wrapped using this tool:

1. A hosted website (e.g. just rendering a url on the internet).
2. A static / local website (e.g. there is no server component).

## Instructions

Regardless of what type of site you are packaging into your application there are some common steps:

1. Fork / clone this repository
2. Update the `AppIcon.appiconset` to your app icon
3. If this is not a [BIFFUD](https://biffud.com) project, update `BIF Logo.imageset` with your loading informaton.

Instructions shift slightly from here:

### Pathway A: Static site

To create a new iOS application that renders a static / local web appplication, do the following:

1. Replace the content of `iOSVirus/Website` with your website's assets.
2. Build and publish.

Note: `index.html` is the entry point.

### Pathway B: Hosted site
To create a new iOS application that renders a hosted website (e.g. a url), do the following:

1. Update `iOSVirus/Views/WebViewController.swift` by commenting L23-L25 (the lines specifying the local paths)
2. In that same file, uncomment L15-L17 (the lines specifying the remote url)
3. Update `appUrl` to be whatever you are trying to host.

## Other Notes

If you use this project please consider giving a shout out to Bad Idea Factory.
