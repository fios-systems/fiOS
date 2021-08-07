baseline
baselineProjects: spec
  spec
    baseline: 'Seaside3'
    with: [ 
      spec
        loads: #('Core' 'Development' 'Zinc' 'Email' 'CI');
        repository: 'github://SeasideSt/Seaside:master/repository' ].
  spec
    baseline: 'SuperAdmin'
    with: [ spec repository: 'github://fios-systems/SuperAdmin:master/repository' ].
  spec
    baseline: 'Mustache'
    with: [ 
      spec
        loads: #('Core');
        repository: 'github://noha/mustache:master/repository' ]