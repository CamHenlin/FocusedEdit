# FocusedEdit
FocusedEdit is a software package for classic Macintosh (System 2.0 through MacOS 9.2.2) systems to provide a bidirectional text editor from the Mac to modern web browsers via the serial port, utilizing [CoprocessorJS](https://github.com/CamHenlin/coprocessor.js)

![focusededit boxart](https://user-images.githubusercontent.com/1225579/193201468-da7a2685-5357-4d86-8bcf-1b6c229ce7ac.png)

## How to use FocusedEdit
I wrote an [article on my blog](https://henlin.net/2022/10/02/Introducing-FocusedEdit-for-classic-Macintosh/) outlining how to get up and running.

## Technologies
FocusedEdit is built on a lot of technologies. The READMEs of each of these is each worth familiarizing yourself with if you would like to contribute to FocusedEdit:

- [Retro68](https://github.com/autc04/Retro68) - a GCC-based cross compilation env for classic Macintosh systems
- [CoprocessorJS](https://github.com/CamHenlin/coprocessor.js) - a library that allows us to handle nodejs workloads sent over a serial port
- [serialperformanceanalyzer](https://github.com/CamHenlin/serialperformanceanalyzer) - used to analyze the performance of many different parts of the application during its development lifecycle
- [TESample](https://github.com/CamHenlin/TESample) - this is a basic Macintosh Toolbox demo application that the text editing portion of FocusedEdit is essentially riffing off of

## Limitations / areas for improvement
FocusedEdit is 100% usable and I've been using it daily to write out long slack messages, confluence docs, emails since mid 2022, but it could be even better with your help:

- More work could be done to support editing functionality like holding `shift+arrow keys` to highlight blocks of text. As is, you must use the mouse to highlight blocks of text
- Additional fonts could be included
- Polling from the classic Mac to the web browser is kind of clunky and only done when the user has not interacted with the app for several seconds. This works fine for now assuming you want to do most of the editing on the Macintosh side. That's what we're here for, right?
- Special character support is lacking. For example, modern Macs like to replace quotation marks with stylized ones. We convert them back to standard quotation marks on the classic Macintosh side. 
- It would be cool to support additional fonts
- Document width is fixed

## Animated Demo
Here's a short demo of FocusedEdit in action:

![focusededit demo](https://user-images.githubusercontent.com/1225579/193197483-4a8b7c75-a78e-4ffb-b708-1ec9a2aec05a.gif)
