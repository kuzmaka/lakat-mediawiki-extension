<?php
/**
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * @file
 */

namespace MediaWiki\Extension\Lakat;

namespace MediaWiki\Extension\Lakat;

use Skin;
use OutputPage;
use SkinTemplate;

class Hooks {

	public static function onBeforePageDisplay( OutputPage $out, Skin $skin ) {
		$config = $out->getConfig();
		if ( $config->get( 'LakatVandalizeEachPage' ) ) {
			$out->addModules( 'oojs-ui-core' );
			$out->addHTML( \Html::element( 'p', [], 'Lakat was here' ) );
		}
	}

	public static function onSkinTemplateNavigationUniversal( array &$links, SkinTemplate $skin ) {
		$links['actions']['switchbranch'] = [
			'class' => false,
			'text' => $skin->msg( 'lakat-switchbranch' )->text(),
			'href' => 'https://google.com',
			'title' => $skin->msg( 'lakat-switchbranch-tooltip' )->text(),
		];
	}

}