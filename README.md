TweetMemeUnfolder
=================

Apparently one of the latest meme trends is to create Tweets that link to other Tweets that (seem to endlessly) link to other Tweets (such as the one at https://twitter.com/charliesome/status/433472351343112192). This little CLI tool tries to retrieve all of them.

# Twitter API
This utility makes use of the `twitter` gem to access the Twitter API. Upon the first run it will create a sample YAML config file in which you should define your Twitter Consumer API-key and -secret. 

See `unfold_tweets_example.rb` for usage examples.


# Example output:
```
$ ./unfold_tweets_example.rb
Will try to expand tweet at https://twitter.com/charliesome/status/433472351343112192 till we find the source of the tweet link meme:
------------------------------------------------------------------------------
<charliesome/Charlie Somerville> Just completely digusted by this: https://t.co/028fRBEuBi // https://twitter.com/charliesome/status/433472351343112192
<markdalgleish/Mark Dalgleish> If there was a little less of this on Twitter, I think we'd all be much happier https://t.co/MOZlpzLZxE // https://twitter.com/markdalgleish/status/433469411375067136
<keithpitt/Keith Pitt> No words https://t.co/81XylGFeYk // https://twitter.com/keithpitt/status/433468433078812672
<quackingduck/Myles Byrne> FFS https://t.co/cpGzrdQ06v // https://twitter.com/quackingduck/status/433467552849600513
<izs/isaacsbot> Please stop https://t.co/XpKusRH2Cb // https://twitter.com/izs/status/433464696289497088
<seldo/Laurie Voss> Jesus christ: https://t.co/4od5XJIBLy // https://twitter.com/seldo/status/433463395547770881
<meat/Zack Voase> You *have* to be kidding me. It's 2014. https://t.co/iIPfaoDtyJ // https://twitter.com/meat/status/433461028274188288
<isaach/Isaac Hepworth> good grief https://t.co/DX6xNXUQkU // https://twitter.com/isaach/status/433460018914922496
<sampullara/Sam Pullara> it is fairly unbelievable that i have never seen this on twitter before: https://t.co/E9oVfaekpI // https://twitter.com/sampullara/status/433459738924179456
<cmyang/Charles the Yang> No. Way. Can't believe it! https://t.co/N53QHkgukZ // https://twitter.com/cmyang/status/433458862130495488
<mattyglesias/Matt Yglesias> Interesting point from @WillOremus: https://t.co/kIbLhRStG5 // https://twitter.com/mattyglesias/status/433435023661088768
<WillOremus/Will Oremus> This, from @jpodhoretz, is utterly substance-free and a complete waste of time. Good only for a laugh. https://t.co/LNf5RWtTna // https://twitter.com/WillOremus/status/433431276352053248
<jpodhoretz/John Podhoretz> I have to admit I agree with McKay Coppins here. https://t.co/w9836Tre3k // https://twitter.com/jpodhoretz/status/433429868152225792
<mckaycoppins/McKay Coppins> What else would you expect from an anti-Clinton website like the Free Beacon? So tired of this stuff. https://t.co/Yzcc7MHhpG // https://twitter.com/mckaycoppins/status/433387422760443904
<lachlan/Lachlan Markay> This was a new twitter phenomenon today that, for better or worse, could catch on. And yes, I'm fueling it right now https://t.co/JIozj6ZtKP // https://twitter.com/lachlan/status/433386785964826624
<ChrisLoesch/Chris Loesch> I'm offended for everyone. https://t.co/jbCEtmZeoG // https://twitter.com/ChrisLoesch/status/433382639668428801
<sunnyright/SunnyRight> No. Just no. https://t.co/zVPsTsTkdi // https://twitter.com/sunnyright/status/433342799241420800
<Heminator/Mark Hemingway> That's it. @baseballcrank has finally gone off the rails. https://t.co/A1rwB5o6s2 // https://twitter.com/Heminator/status/433340459239235585
<baseballcrank/Dan McLaughlin> I am offended. https://t.co/jQcwhEyYO8 // https://twitter.com/baseballcrank/status/433339338386993154
<lachlan/Lachlan Markay> Well, it is now. https://t.co/Rrn7E17OUW // https://twitter.com/lachlan/status/433339253871742976
<BenHowe/Ben Howe> This is exactly the kind of thing that @Lachlan rails on regularly at Free Beacon.  https://t.co/9OhZxvic03 // https://twitter.com/BenHowe/status/433339087320133633
<fuegote/Christopher V. Enger> I hope @steph_grimes responds RE https://t.co/VQK6YqXyoQ // https://twitter.com/fuegote/status/433327431378694145
<AceofSpadesHQ/King_Ghidorah> I believe @iowahawkblog has written about this affair extensively.  https://t.co/XwpuFuH1XO // https://twitter.com/AceofSpadesHQ/status/433326472070057984
<BenK84/Ben> I imagine @AceofSpadesHQ  will want to churn out a few thousand words on this topic. https://t.co/tdJHp69QL1 // https://twitter.com/BenK84/status/433259921409196032
<RBPundit/RB> When the dust settles on this, I'm going to write 5000 words about the whole thing. https://t.co/TDya18Ghwm // https://twitter.com/RBPundit/status/433259587139940352
<Neal_Dewing/Neal> I think I'm just going to accept this uncritically. https://t.co/1joohMhOMX // https://twitter.com/Neal_Dewing/status/433259154980220929
<moelane/Moe Lane> Oh, THIS cannot be allowed to remain unaddressed: https://t.co/0CfIeZeDUX // https://twitter.com/moelane/status/433252368189497344
<Popehat/Popehat> I am in the process of writing a devastating reply to this nonsense: https://t.co/ol8sWgjG7Y // https://twitter.com/Popehat/status/433251577726398464
<LeonHWolf/Leon Wolf> Expect my rejoinder to this later this afternoon. https://t.co/iCvHlvFyHk // https://twitter.com/LeonHWolf/status/433250987801718784
<redsteeze/S.M> I'll be writing up a response to this @BenHowe tweet https://t.co/7BjhmStY0X // https://twitter.com/redsteeze/status/433250487404879872
<BenHowe/Ben Howe> I’ll respond to this later. https://t.co/S3nr8EOjuR // https://twitter.com/BenHowe/status/433249756006346752
Tweet at https://twitter.com/charlescwcooke/status/433249614431809536 with status id 433249614431809536 that was last referred to in Tweet at https://twitter.com/BenHowe/status/433249756006346752 could not be found.
Tweet link meme for https://twitter.com/charliesome/status/433472351343112192 ends here.
```
