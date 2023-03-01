<?php
define( 'DB_NAME', 'WordPress' );

define( 'DB_USER', getenv('WP_ADMIN_USER') );
define( 'DB_PASSWORD', getenv('WP_ADMIN_PASSWORD') );
define( 'DB_HOST', 'WordPress' );

define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

/** generate key here: https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         ',|opcY)9yiA>jO oT|&M!03XbYL/}.(%~`!4mH^o.- =SsRs20-aaao7,3IXa)_^');
define('SECURE_AUTH_KEY',  'aHHJ:gd8l;(rIi0sa>5G?)jB[v3M?NJXzNh+J^QQt0R-[dDcD;Ld{R|_bC,mb`N@');
define('LOGGED_IN_KEY',    'Bl]_cA~3y3a:vTQC|/@Ih(,@U@ xE%Z0R&i[0DZ29C|ogV3tdPK&xl}k&u~Hn1KX');
define('NONCE_KEY',        'xBX-c*O2Jfc-]]t}iX.f|FoGYyRT2Ws&aYnNl *`-%[-?sMna-#74,X5t9!7GSIm');
define('AUTH_SALT',        '$Z@i?ta=@l(R5l)9TYyx:yu%d[FR(Zs]x<+h1.yn@KjY;Xr-.bB8F0>4.s1Oode6');
define('SECURE_AUTH_SALT', '9iSXeye&5U}p|;saInktrC(!z|ZlcD9o8^ CB*NAsCqOd5;4^T!$-9WuC9CP0+4#');
define('LOGGED_IN_SALT',   '9j8&{C$)m[wU|]V5A6Kr%*VeM[tk-D1)Wn>#=gK-+XyQyP!$X1B4$%)<-)+TX(R)');
define('NONCE_SALT',       '0az*]MuMMDvwE(3d%|5*C>72]|8AxdC+{2yl{T/PCr}FA4G%ubp(v+jC<xK/kuo$');


$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/WordPress' );
}

require_once ABSPATH . 'wp-settings.php';