  p = read_vector( 'dragon.vector' );
  alpha=10;
  p_extended = extend_signal( p, 44100, 180.0, 500, 180.0, 30.0,165.0,195.0,1.0,alpha );

  % Normalize
  M = max( abs( p_extended ) );
  p_extended = p_extended / ( M * 1.01 );

  wavwrite( p_extended, 44100, 'dragon_extended.wav' );