uploaded metadata
emailimagespassanimateGif
	^ WAFileLibraryResource
		filepath: 'email/images/pass-animate.gif'
		mimeType: (WAMimeType main: 'image' sub: 'gif')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #emailimagespassanimateGifContent)