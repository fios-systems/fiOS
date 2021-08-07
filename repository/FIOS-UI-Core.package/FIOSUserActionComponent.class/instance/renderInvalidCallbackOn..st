rendering
renderInvalidCallbackOn: canvas
  canvas div
    class: 'login__block';
    class: 'active';
    id: 'l-invalid-callback';
    with: [ 
          canvas div
            class: 'login__block__header';
            with: [ 
                  self renderLogoOn: canvas.
                  canvas text: 'Sorry, I don''t know what to do.'.
                  self renderLoginActionsOn: canvas ].
          canvas div
            class: 'login__block__body';
            with: [ 
                  canvas
                    paragraph:
                      'The link from your email may have expired as it is no longer valid. I apologise for any inconvenience.' ] ]