# RailsCasts downloader

**It is not intended by this repository to incentive and/or do piracy. I use
this script to download the videos for myself and wath them later in my lunch
time. To download private videos, you will have to provide your KEY.**

![print](http://f.cl.ly/items/0D2x1k060B0g0e3o2C0j/Screen%20Shot%202013-07-08%20at%2011.57.40%20PM.png)

# Usage

To download PRO videos, create a `key.txt` file with your API key in it.

You can found your API while downloading a PRO video, the URL will be something
like:

`http://media.railscasts.com/assets/subscriptions/{KEY}/videos/{EP_NAME}.${FORMAT}`

You can pay for the pro videos in railscasts site. It totally worth it.

# Downloading

Create an `input.txt` file with the EPs number (leftpadded with zeroes to length
3) and the EP name, like:

```
417-foundation
123-some-other-ep
001-the-very-first-one
```

Then run the `.sh` file in a folder where you have sufficient disk space.

That's it.
