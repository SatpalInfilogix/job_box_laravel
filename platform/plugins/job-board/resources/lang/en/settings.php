<?php

return [
    'job_board' => 'Job Board',
    'general' => [
        'title' => 'General',
        'description' => 'General settings for Job Board',
        'enable_guest_apply' => 'Enable guest apply?',
        'enabled_register_as_employer' => 'Allow visitors to register as employer and post their jobs?',
        'verify_account_email' => "Verify account's email?",
        'verify_account_created_company' => "Verify account's created company?",
        'enable_post_approval' => 'Enable post approval?',
        'job_expired_after_days' => 'Job Expired Time (days)',
        'enable_credits_system' => 'Enable credits system (employers need to buy credits to post their jobs)',
        'enable_review_feature' => 'Enable review feature?',
        'default_account_avatar' => 'Default account avatar',
        'default_account_avatar_helper' => "It's used in case users don't have an avatar.",
        'using_custom_font_for_invoice' => 'Using custom font for invoice?',
        'invoice_font_family' => 'Invoice font family (Only work for Latin language)',
        'enable_invoice_stamp' => 'Enable invoice stamp?',
        'invoice_support_arabic_language' => 'Support Arabic language in invoice?',
        'invoice_code_prefix' => 'Invoice code prefix',
        'job_location_display' => 'Job location display?',
        'state_and_country' => 'State & Country',
        'city_and_state' => 'City & State',
        'city_state_and_country' => 'City, State & Country',
        'disabled_public_profile' => 'Disable public profile?',
        'enable_zip_code' => 'Enable zip code (postal code)?',
        'enable_recaptcha_in_register_page' => 'Enable Recaptcha in the registration page?',
        'enable_recaptcha_in_pages_description' => 'Need to setup Captcha in Admin -> Settings -> General first.',
        'enable_recaptcha_in_apply_job' => 'Enable Recaptcha in the apply job?',
        'hide_company_email' => 'Hide company email?',
        'enable_custom_fields' => 'Enable custom fields?',
        'allow_employer_multiple_companies' => 'Allow employers to create multiple company profiles?',
        'allow_employer_manage_company_info' => 'Allow employers to manage company profile information?',
    ],
    'currency' => [
        'title' => 'Currencies',
        'description' => 'List of currencies using on website',
        'name' => 'Name',
        'symbol' => 'Symbol',
        'number_of_decimals' => 'Number of decimals',
        'exchange_rate' => 'Exchange rate',
        'is_prefix_symbol' => 'Position of symbol',
        'is_default' => 'Is default?',
        'remove' => 'Remove',
        'new_currency' => 'Add a new currency',
        'save_settings' => 'Save settings',
        'before_number' => 'Before number',
        'after_number' => 'After number',
        'require_at_least_one_currency' => 'The system requires at least one currency!',
        'enable_auto_detect_visitor_currency' => 'Enable auto-detect visitor currency?',
        'auto_detect_visitor_currency_description' => 'It detects visitor currency based on browser language. It will override default currency selection.',
        'add_space_between_price_and_currency' => 'Add a space between price and currency?',
        'invalid_currency_name' => 'Invalid currency code, it must be in :currencies.',
        'instruction' => 'Please check list currency code here: https://en.wikipedia.org/wiki/ISO_4217',
        'code' => 'Code',
        'thousands_separator' => 'Thousands separator',
        'decimal_separator' => 'Decimal separator',
        'separator_period' => 'Period (.)',
        'separator_comma' => 'Comma (,)',
        'separator_space' => 'Space ( )',
    ],
    'invoice' => [
        'title' => 'Invoice',
        'description' => 'Customize the template and company information for invoicing',
        'using_custom_font_for_invoice' => 'Using custom font for invoice?',
        'invoice_font_family' => 'Invoice font family (Only work for Latin language)',
        'enable_invoice_stamp' => 'Enable invoice stamp?',
        'invoice_support_arabic_language' => 'Support Arabic language in invoice?',
        'invoice_code_prefix' => 'Invoice code prefix',
        'company_name' => 'Company name',
        'company_address' => 'Company address',
        'company_email' => 'Company email',
        'company_phone' => 'Company phone',
        'company_logo' => 'Company logo',
    ],
    'invoice_template' => [
        'title' => 'Invoice template',
        'description' => 'Customize the template for invoicing',
        'content' => 'Content',
        'preview' => 'Preview',
    ],
];
