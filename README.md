# MSVC Cleanup File
A batch file cleaning up the revolting mess MSVC will sometimes leave upon being removed forcefully.

## The Issue (MSVC, how about no)
MSVC local installer will sometimes run into this very annoying and frequent issue where it will not detect a local installation of MSVC __even though it is installed in exactly the right place__. Trying to remove MSVC by using the __Install Cleanup__ utility will _not do anything_ except simply show to you that the program has run itself. This will not work:
```
"Drive:\path\to\install_cleanup.exe" -f
```

I would recommend _very much_ against trying to post on the Microsoft Help Forums, unless, of course, you really enjoy reading __"We are extremely sorry for your trouble, please provide us with your system make, model, your id, your DNA fingerprints, your mother's maiden name, etc..."__,

after which they will promptly advise you to restart your PC.

Absolutely nothing I have tried seems to fix the issue and the only way to remove it from the system without wasting further time on such a thing would be a forceful manual delete.

The problem is, after you have removed MSVC, the file associations and right-click context menu items still remain.

I have provided a batch file ![msvc_cleanup.bat](https://github.com/aminiqbal/msvc_cleanup/blob/main/msvc_cleanup.bat) which upon execution will remove the most common filetype associations as well as any MSVC items on any right-click menu list.

## Usage
__PLEASE NOTE THAT YOU MUST RUN THE .BAT FILE BY RIGHT-CLICKING ON IT AND SELECTING:__ ```Run as administrator``` __OTHERWISE THE REGISTRY CHANGES WILL NOT BE MADE.__

What is going on in the __.bat__ file is this (You may inspect the file to confirm):
	* I construct lines to add to a __.reg__ file.
	* I write these lines to an actual instance of a __.reg__ file and place it in the same directory as the __.bat__ file. The file is called ```file.reg```. This file will make the necessary changes to the system registry.
	* I execute the __.reg__ file in a silent way, so you do not have to go through multiple dialog prompts. I do this via this command:
	```
	%WINDIR%\system32\reg.exe import file.reg
	```
	* I _delete_ the __.reg__ file to clean up _my_ mess. You see, I'm not _Microsoft_.
	* I will then reset the __icon cache__ of your user instance so you don't have to log out/ reset your PC to remove file associations and MSVC icons appearing for source code files. I do this via this command:
	```
	start ie4uinit.exe -show
	```
	* You should see a dialog:
	```
	---- MSVC MESS CLEANED ----
	```
	* The program exits on a _key press_.

__PLEASE NOTE THAT YOU MUST RUN THE .BAT FILE BY RIGHT-CLICKING ON IT AND SELECTING:__ ```Run as administrator``` __OTHERWISE THE REGISTRY CHANGES WILL NOT BE MADE.__

## Further Configuration
I can guarantee there are other hidden registry values relating to MSVC. Provided are the main ones, but if you find more or run active searches for them, you are able to remove those _registry keys_ by just adding the _key_ path after ```Computer\``` and placing a ```-``` in front of the path and then enclosing the entire thing in square brackets.

Example:
```
[-HKEY_CLASSES_ROOT\Directory\shell\AnyCode]
```

* There are 2 good ways of doing this:
	* Creating your own __.reg__ file and then running it. Just __add__ your desired keys in the manner as show above to the __end of these lines__:
	```
	Windows Registry Editor Version 5.00


	```
	* Adding to the provided __.bat__ file and running it __as administrator__ again. Values that were previously removed will simply be ignored, unless you've configured them - in which case, they will be removed as well.
		* Please note that in this case, you will have to add your lines __before__ the line:
		```
		>file.reg
		```
		and for __every__ one of your desired key paths with a ```^``` followed by __1 blank line__. This is just some __.bat__ oddity will output proper lines to the file since __.reg__ files are sensitive to lines. An example would be (__please make sure not to add an extra__ ```>file.reg``` __to the code again__):
		```
		...
		[-HKEY_CLASSES_ROOT\Directory\shell\AnyCode]^

		>file.reg
		...
		```
<hr>
I hope this will aid someone in case they come across this situation.
The __.bat__ file can be repurposed in many ways to fit any other Windows customizing needs.
