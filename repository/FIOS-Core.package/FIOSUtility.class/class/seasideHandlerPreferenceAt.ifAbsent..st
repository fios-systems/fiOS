seaside
seasideHandlerPreferenceAt: aKey ifAbsent: aBlock
  ^ [ WACurrentRequestContext value application preferenceAt: aKey ]
    on: WARequestContextNotFound , WAAttributeNotFound
    do: [ :ex | aBlock value ]	"in a Seaside context"	"not in a Seaside context, treat as absent"