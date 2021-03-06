baseline
baseline: spec
  <baseline>
  self baselineProjects: spec.
  spec
    for: #'common'
    do: [ 
      spec
        package: 'FIOS-Core';
        package: 'FIOS-Model-Core' with: [ spec requires: #('FIOS-Core') ];
        package: 'FIOS-UI-Core' with: [ spec requires: #('FIOS-Model-Core') ];
        package: 'FIOS-Tests-Model-Core'
          with: [ spec requires: #('FIOS-Model-Core') ].
      spec
        group: 'default' with: #('development');
        group: 'development' with: #('production' 'tests');
        group: 'production' with: #('dependencies' 'FIOS-UI-Core');
        group: 'tests' with: #('FIOS-Tests-Model-Core');
        group: 'dependencies'
          with:
            #('PharoCompatibility' 'ZincHTTPComponents' 'Seaside3' 'Magritte3' 'RenoirSt' 'Parasol' 'Cryptography' 'Bootstrap5' 'BootstrapMagritte' 'FontAwesomePro' 'SuperAdmin' 'BpmFlowUI' 'Mustache')
         ]