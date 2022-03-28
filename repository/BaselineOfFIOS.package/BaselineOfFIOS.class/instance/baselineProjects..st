baseline
baselineProjects: spec
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
          with: [ 
              spec
                loads: #('Core' 'Development' 'Zinc' 'Email' 'REST' 'CI');
                repository: 'github://SeasideSt/Seaside:master/repository' ];
        baseline: 'ZincHTTPComponents'
          with: [ 
              spec
                className: 'BaselineOfZincHTTPComponents';
                loads: #('Core' 'REST' 'SSO' 'WebSocket');
                repository: 'github://GsDevKit/zinc:gs_master/repository' ];
        baseline: 'Magritte3'
          with: [ 
              spec
                loads: #('Core' 'Tests' 'Seaside');
                repository: 'github://GsDevKit/Magritte3:master/repository' ];
        configuration: 'BootstrapMagritte'
          with: [ 
              spec
                versionString: '0.2.3';
                repository:
                    'github://JupiterSmalltalk/Bootstrap-Magritte:master/src' ];
        baseline: 'RenoirSt'
          with: [ 
              spec
                loads: #('Deployment-Seaside-Extensions');
                repository: 'github://brunobuzzi/RenoirSt:v4.0.0g/source' ];
        baseline: 'Parasol'
          with: [ 
              spec
                loads: #('default');
                repository: 'github://SeasideSt/Parasol/repository' ];
        baseline: 'Bootstrap5'
          with: [ 
              spec
                loads: #('all');
                repository: 'github://JupiterSmalltalk/Bootstrap5/repository' ];
        baseline: 'FontAwesomePro'
          with: [ 
              spec
                loads: #('default');
                repository:
                    'github://JupiterSmalltalk/FontAwesomePro/repository' ];
        baseline: 'SuperAdmin'
          with: [ 
              spec
                loads: #('default');
                repository: 'github://JupiterSmalltalk/SuperAdmin/repository' ];
        baseline: 'BpmFlowUI'
          with: [ 
              spec
                loads: #('default');
                repository: 'github://JupiterSmalltalk/BpmFlowUI/repository' ];
        baseline: 'Cryptography'
          with: [ 
              spec
                loads: #('CI');
                repository: 'github://GsDevKit/Cryptography:master/repository' ];
        baseline: 'PharoCompatibility'
          with: [ 
              spec
                loads: #('Core');
                repository:
                    'github://glassdb/PharoCompatibility:master/repository' ];
        baseline: 'Mustache'
          with: [ 
              spec
                loads: #('Core');
                repository:
                    'github://JupiterSmalltalk/mustache:master/repository' ];
        baseline: 'JQueryMouseWheel'
          with: [ 
              spec
                loads: #('default');
                repository:
                    'github://JQUeryWidgetKit/jquery-mousewheel:seaside/repository' ] ]