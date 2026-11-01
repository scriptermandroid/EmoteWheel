# EmoteWheel

The only thing that can be exported from Roblox without it showing up as '.rbxm' is scripts, so keep this in mind.

I stored the Roblox Emotes in a folder. Doing it this way allowed the script to recognize how many emotes it was dealing with automatically--this meant whoever was using the script didn't have to mess with the code at all to use the emote wheel for themselves. 

8 emotes can fit on the emote wheel at a time. This is the slots, which are the spots on the array. The emotes themselves are also all put into a separate array.
Things in Roblox Lua (called Luau) called Instances exist, and have properties. I set the eight slots equal to the first eight emotes relevant properties, and if you click the next button, the slots are set to the next eight, and so on.

The search function just matches the input text to the emotes name and lists the closest matches on the emote wheel.

