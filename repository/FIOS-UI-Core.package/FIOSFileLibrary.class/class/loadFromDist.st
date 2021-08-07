load from disk
loadFromDist
  "FIOSFileLibrary loadFromDist"

  (self allSelectors
    select: [ :selector | 
      #(#'uploaded' #'uploaded metadata')
        includes: (self categoryOfSelector: selector) ])
    do: [ :selector | self removeSelector: selector ].
  self removeEmptyCategories.
  self
    recursivelyAddAllFilesIn:
      '/opt/git/fios-systems/fiOS/www_root/files/FIOSFileLibrary'