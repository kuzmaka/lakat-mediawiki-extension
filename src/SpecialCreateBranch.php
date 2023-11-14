<?php

namespace MediaWiki\Extension\Lakat;

use FormSpecialPage;
use Title;

class SpecialCreateBranch extends FormSpecialPage
{
	public function __construct()
	{
		parent::__construct('CreateBranch');
	}

	protected function getDisplayFormat() {
		return 'ooui';
	}

	protected function getFormFields() {
		$formDescriptor = [
			'BranchName' => [
				'type' => 'text',
				'label-message' => 'createbranch-name',
			],
			'Token' => [
				'type' => 'text',
				'label-message' => 'createbranch-token',
			],
			'BranchType' => [
				'type' => 'radio',
				'flatlist' => 1,
				'options-messages' => [
					'createbranch-type-proper' => 'proper',
					'createbranch-type-twig' => 'twig'
				],
				'default' => 'proper',
			],
			'AllowConflicts' => [
				'type' => 'check',
				'label-message' => 'createbranch-allow-conflicts',
				'value' => 0,
			],
		];

		return $formDescriptor;
	}

	public function onSubmit(array $data) {
		return $this->redirectToCreatePage($data);
	}

	public function redirectToCreatePage(array $data) {
		$pageName = $data[ 'BranchName' ];

		$title = Title::newFromText( $pageName );
		if ($title->isKnown() || !$title->canExist() ) {
			return false;
		}

		$query = [
			'redlink' => 1,
			'action' => 'edit',
		];
		$target = $title->getLocalUrl( $query );

		$this->getOutput()->redirect( $target, '301' );
	}
}
