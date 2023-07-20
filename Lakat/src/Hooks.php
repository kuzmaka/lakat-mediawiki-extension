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

use SkinTemplate;



class Hooks implements 
	\MediaWiki\Hook\BeforePageDisplayHook,
	\MediaWiki\Hook\SkinTemplateNavigation__UniversalHook
{

	/**
	 * @see https://www.mediawiki.org/wiki/Manual:Hooks/BeforePageDisplay
	 * @param \OutputPage $out
	 * @param \Skin $skin
	 */
	public function onBeforePageDisplay( $out, $skin ): void {
		$config = $out->getConfig();
		if ( $config->get( 'LakatVandalizeEachPage' ) ) {
			$out->addModules( 'oojs-ui-core' );
			$out->addHTML( \Html::element( 'p', [], 'Lakat was here' ) );
		}
	}

	# https://www.mediawiki.org/wiki/Manual:Hooks/SkinTemplateNavigation
	# use the 'Universal' skin to add a link to the top navigation bar
	
	public function onSkinTemplateNavigation__Universal($sktemplate, &$links ): void {
		$links['actions']['switchbranch'] = [
			'class' => false,
			'text' => $sktemplate->msg( 'lakat-switchbranch' )->text(),
			'href' => 'https://google.com',
			'title' => $sktemplate->msg( 'lakat-switchbranch-tooltip' )->text(),
		];

		$links['views_primary']['switchbranch'] = [
			'class' => false,
			'text' => $sktemplate->msg( 'lakat-views-primary' )->text(),
			'href' => 'https://google.com',
			'title' => $sktemplate->msg( 'lakat-views-primary-tooltip' )->text(),
		];

		
	}

	// public static function onPersonalUrls( array &$personal_urls, Title $title, SkinTemplate $skin ) {
	// 	$personal_urls['branch'] = [
	// 		'text' => 'Change Branch',
	// 		'href' => 'https://google.com',
	// 	];
	// }


	// public static function onSkinTemplateNavigation( SkinTemplate $skinTemplate, array &$links ) {
	// 	$links['namespaces']['lakat'] = [
	// 		'class' => false,
	// 		'text' => 'Lakat',
	// 		'href' => '/wiki/Lakat:Main_Page',
	// 	];
	// 	return true;
	// }

}
