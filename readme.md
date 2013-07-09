# RailsCasts downloader

## Disclaimer

**It's not intended by this repository to incentive and/or do piracy. I use
this script to download the videos for myself and watch them later in my lunch
time and bus. To download PRO videos, you will have to provide your KEY.**

![print](http://f.cl.ly/items/3f2T130z3t2E2g1E2p1X/Screen%20Shot%202013-07-09%20at%202.23.25%20AM.png)

# Usage

To download PRO videos, create a `key.txt` file with your API key in it.

You can found your API while downloading a PRO video, the URL will be something
like:

```
http://media.railscasts.com/assets/subscriptions/{KEY}/videos/{EP_NAME}.{FORMAT}
                                                   /\ this is the  key =)
```

You can buy a PRO railscasts account in [railscast site](http://railscasts.com).

# Downloading

There is already a node.js script called `extractor`, which will generate the
`input.txt` file with all EPs. Sooner I'll implement the download by EP number
as suggested in Ruby on Rails Brasil Facebook page. For now, you will have to
handle it manually or download all EPs.

Run `./script.sh` to download all EPs specified in `input.txt` or run
`./script.sh 123 321 234` to download episodes 123, 321 and 234.

I will try to keep input updated, if you want to update it by yourself, cd to
extractor dir and run:

```
npm install
./script.js
```

It will automagically update your `input.txt` file.

Enjoy.

# Thanks

Thanks Ryan Bates for the great videos and great site, with a solid API.

# Donate

Please, donate to Ryan instead, or just get a PRO account. It's worth it!
