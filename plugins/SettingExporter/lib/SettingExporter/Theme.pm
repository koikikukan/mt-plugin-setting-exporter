package SettingExporter::Theme;
use strict;

use MT;
#use Data::Dumper;

sub template {
    my $app = shift;
    my ( $blog, $saved ) = @_;

#    my %checked_ids;
#    if ( $saved ) {
#        %checked_ids = map { $_ => 1 } @{ $saved->{plugin_default_settings_export_ids} };
#    }

    my %param;

    # cfg_prefs
    $param{name} = 'name';
    $param{description} = 'description';
    $param{site_path} = 'site_path';
    $param{site_url} = 'site_url';
    $param{file_extension} = 'file_extension';
    $param{server_offset} = 'server_offset';
    $param{cc_license} = 'cc_license';
    if ($blog->parent_id) {
        $param{is_blog} = 1; 
        $param{archive_type_preferred} = 'archive_type_preferred';
        $param{archive_url} = 'archive_url';
        $param{archive_path} = 'archive_path';
    } else {
        $param{is_blog} = 0; 
    }
    $param{use_revision} = 'use_revision';
#    $param{max_revisions_entry} = 'max_revisions_entry';
#    $param{max_revisions_template} = 'max_revisions_template';

    # cfg_entry
    $param{days_on_index} = 'days_on_index';
    $param{entries_on_index} = 'entries_on_index';
    $param{sort_order_posts} = 'sort_order_posts';
    $param{words_in_excerpt} = 'words_in_excerpt';
    $param{language} = 'language';
    $param{basename_limit} = 'basename_limit';
    $param{status_default} = 'status_default';
    $param{convert_paras} = 'convert_paras';
    $param{allow_comments_default} = 'allow_comments_default';
    $param{allow_pings_default} = 'allow_pings_default';

    # cfg_feedback
    $param{junk_folder_expiry} = 'junk_folder_expiry';
    $param{junk_score_threshold} = 'junk_score_threshold';
    $param{nofollow_urls} = 'nofollow_urls';
    $param{follow_auth_links} = 'follow_auth_links';
    $param{allow_reg_comments} = 'allow_reg_comments';
    $param{moderate_unreg_comments} = 'moderate_unreg_comments';
    $param{allow_comment_html} = 'allow_comment_html';
    $param{sanitize_spec} = 'sanitize_spec';
    $param{email_new_comments} = 'email_new_comments';
    $param{sort_order_comments} = 'sort_order_comments';
    $param{autolink_urls} = 'autolink_urls';
    $param{convert_paras_comments} = 'convert_paras_comments';
#    $param{captcha_provider} = 'captcha_provider';
    $param{use_comment_confirmation} = 'use_comment_confirmation';
    $param{allow_pings} = 'allow_pings';
    $param{moderate_pings} = 'moderate_pings';
    $param{email_new_pings} = 'email_new_pings';
    $param{autodiscover_links} = 'autodiscover_links';
    $param{internal_autodiscovery} = 'internal_autodiscovery';

    # cfg_registration
    $param{allow_commenter_regist} = 'allow_commenter_regist';
    $param{allow_unreg_comments} = 'allow_unreg_comments';
    $param{require_comment_emails} = 'require_comment_emails';
#    $param{enabled_MovableType} = 'enabled_MovableType';
#    $param{enabled_OpenID} = 'enabled_OpenID';
#    $param{enabled_LiveJournal} = 'enabled_LiveJournal';
#    $param{enabled_Vox} = 'enabled_Vox';
#    $param{enabled_Google} = 'enabled_Google';
#    $param{enabled_Yahoo} = 'enabled_Yahoo';
#    $param{enabled_AIM} = 'enabled_AIM';
#    $param{enabled_WordPress} = 'enabled_WordPress';
#    $param{enabled_YahooJP} = 'enabled_YahooJP';
#    $param{enabled_livedoor} = 'enabled_livedoor';
#    $param{enabled_Hatena} = 'enabled_Hatena';
#    $param{enabled_mixicomment} = 'enabled_mixicomment';

    # cfg_web_services
    $param{remote_auth_token} = 'remote_auth_token';
    $param{ping_google} = 'ping_google';
    $param{ping_weblogs} = 'ping_weblogs';
    $param{ping_others} = 'ping_others';
    $param{mt_update_key} = 'mt_update_key';

#    $param{allow_anon_comments} = 'allow_anon_comments';
#    $param{theme_id} = 'theme_id';
#    $param{welcome_msg} = 'welcome_msg';

#    $param{ping_blogs} = 'ping_blogs';
#    $param{old_style_archive_links} = 'old_style_archive_links';
#    $param{ping_technorati} = 'ping_technorati';
#    $param{custom_dynamic_templates} = 'custom_dynamic_templates';
#    $param{archive_type} = 'archive_type';
#    $param{manual_approve_commenters} = 'manual_approve_commenters';
#    $param{google_api_key} = 'google_api_key';
#    $param{allow_reg_comments} = 'allow_reg_comments';

#    $param{is_dynamic} = 'is_dynamic';
#    $param{archive_tmpl_monthly} = 'archive_tmpl_monthly';
#    $param{archive_tmpl_weekly} = 'archive_tmpl_weekly';
#    $param{archive_tmpl_daily} = 'archive_tmpl_daily';
#    $param{archive_tmpl_individual} = 'archive_tmpl_individual';
#    $param{archive_tmpl_category} = 'archive_tmpl_category';

    # cfg_prefs
    $param{name_content} = $blog->name;
    $param{description_content} = $blog->description;
    $param{file_extension_content} = $blog->file_extension;
    $param{server_offset_content} = $blog->server_offset;
    $param{cc_license_content} = $blog->cc_license;
    if ($blog->parent_id) {
        $param{site_path_content} = $blog->column('site_path');
        $param{site_url_content} = $blog->column('site_url');
        $param{archive_type_preferred_content} = $blog->archive_type_preferred;
        $param{archive_url_content} = $blog->column('archive_url');
        $param{archive_path_content} = $blog->column('archive_path');
    } else {
        $param{site_path_content} = $blog->site_path;
        $param{site_url_content} = $blog->site_url;
    }
    $param{use_revision_content} = $blog->use_revision;
#    $param{max_revisions_entry_content} = $blog->max_revisions_entry;
#    $param{max_revisions_template_content} = $blog->max_revisions_template;

    # cfg_entry
    $param{days_on_index_content} = $blog->days_on_index;
    $param{entries_on_index_content} = $blog->entries_on_index;
    $param{sort_order_posts_content} = $blog->sort_order_posts;
    $param{words_in_excerpt_content} = $blog->words_in_excerpt;
    $param{language_content} = $blog->language;
    $param{basename_limit_content} = $blog->basename_limit;
    $param{status_default_content} = $blog->status_default;
    $param{convert_paras_content} = $blog->convert_paras;
    $param{allow_comments_default_content} = $blog->allow_comments_default;
    $param{allow_pings_default_content} = $blog->allow_pings_default;

    # cfg_feedback
    $param{junk_folder_expiry_content} = $blog->junk_folder_expiry;
    $param{junk_score_threshold_content} = $blog->junk_score_threshold;
    $param{nofollow_urls_content} = $blog->nofollow_urls;
    $param{follow_auth_links_content} = $blog->follow_auth_links;
    $param{allow_reg_comments_content} = $blog->allow_reg_comments;
    $param{moderate_unreg_comments_content} = $blog->moderate_unreg_comments;
    $param{allow_comment_html_content} = $blog->allow_comment_html;
    $param{sanitize_spec_content} = $blog->sanitize_spec;
    $param{email_new_comments_content} = $blog->email_new_comments;
    $param{sort_order_comments_content} = $blog->sort_order_comments;
    $param{autolink_urls_content} = $blog->autolink_urls;
    $param{convert_paras_comments_content} = $blog->convert_paras_comments;
#    $param{captcha_provider_content} = $blog->captcha_provider;
    $param{use_comment_confirmation_content} = $blog->use_comment_confirmation;
    $param{allow_pings_content} = $blog->allow_pings;
    $param{moderate_pings_content} = $blog->moderate_pings;
    $param{email_new_pings_content} = $blog->email_new_pings;
    $param{autodiscover_links_content} = $blog->autodiscover_links;
    $param{internal_autodiscovery_content} = $blog->internal_autodiscovery;

    # cfg_registration
    $param{allow_commenter_regist_content} = $blog->allow_commenter_regist;
    $param{allow_unreg_comments_content} = $blog->allow_unreg_comments;
    $param{require_comment_emails_content} = $blog->require_comment_emails;
#    $param{enabled_MovableType_content} = $blog->enabled_MovableType;
#    $param{enabled_OpenID_content} = $blog->enabled_OpenID;
#    $param{enabled_LiveJournal_content} = $blog->enabled_LiveJournal;
#    $param{enabled_Vox_content} = $blog->enabled_Vox;
#    $param{enabled_Google_content} = $blog->enabled_Google;
#    $param{enabled_Yahoo_content} = $blog->enabled_Yahoo;
#    $param{enabled_AIM_content} = $blog->enabled_AIM;
#    $param{enabled_WordPress_content} = $blog->enabled_WordPress;
#    $param{enabled_YahooJP_content} = $blog->enabled_YahooJP;
#    $param{enabled_livedoor_content} = $blog->enabled_livedoor;
#    $param{enabled_Hatena_content} = $blog->enabled_Hatena;
#    $param{enabled_mixicomment_content} = $blog->enabled_mixicomment;

    # cfg_web_services
    $param{remote_auth_token_content} = $blog->remote_auth_token;
    $param{ping_google_content} = $blog->ping_google;
    $param{ping_weblogs_content} = $blog->ping_weblogs;
    $param{ping_others_content} = $blog->ping_others;
    $param{mt_update_key_content} = $blog->mt_update_key;


    $param{allow_anon_comments_content} = $blog->allow_anon_comments;
    $param{theme_id_content} = $blog->theme_id;
    $param{welcome_msg_content} = $blog->welcome_msg;

    $param{ping_blogs_content} = $blog->ping_blogs;
    $param{old_style_archive_links_content} = $blog->old_style_archive_links;
    $param{ping_technorati_content} = $blog->ping_technorati;
    $param{custom_dynamic_templates_content} = $blog->custom_dynamic_templates;
    $param{archive_type_content} = $blog->archive_type;
    $param{manual_approve_commenters_content} = $blog->manual_approve_commenters;
    $param{google_api_key_content} = $blog->google_api_key;
    $param{allow_reg_comments_content} = $blog->allow_reg_comments;

    $param{is_dynamic_content} = $blog->is_dynamic;
    $param{archive_tmpl_monthly_content} = $blog->archive_tmpl_monthly;
    $param{archive_tmpl_weekly_content} = $blog->archive_tmpl_weekly;
    $param{archive_tmpl_daily_content} = $blog->archive_tmpl_daily;
    $param{archive_tmpl_individual_content} = $blog->archive_tmpl_individual;
    $param{archive_tmpl_category_content} = $blog->archive_tmpl_category;

    my $plugin = MT->component('SettingExporter');
    return $plugin->load_tmpl('export_setting.tmpl', \%param);
}

sub export {
    my ( $app, $blog, $settings ) = @_;

    my $ids;
    if ( defined $settings ) {
        $ids = $settings->{plugin_default_settings_export_ids};
    }
    return unless scalar @$ids;

#    my %data = map { my ($key, $value) = split(': ', $_); { $key => $value } } @$ids;
    my %data = map { $_ => $blog->column($_) } @$ids;

    return \%data;
}

sub apply {
    my ( $element, $theme, $obj_to_apply ) = @_;

    my $data = $element->{data};
    if (   ref $obj_to_apply ne MT->model('blog')
        && ref $obj_to_apply ne MT->model('website') ) {
        return $element->errtrans(
            'this element cannot apply for non blog object.');
    }
    my $blog = $obj_to_apply;
    for my $conf ( keys %$data ) {
        if ( $blog->has_column($conf) ) {
            my $value = $data->{$conf};
            $blog->$conf($value);
        }
        else {
            die "fatal error!";
        }
    }
    $blog->save
        or return $element->errtrans('Failed to save blog object: [_1]', $blog->errstr);
    return 1;
}

sub info {
    my ($element, $theme, $blog) = @_;
    my $class = defined $blog ? $blog->class : '';
    return $class ? sub { MT->translate('default settings for [_1]', MT->translate($class) ) }
                  : sub { MT->translate('default settings' ) }
                  ;
}

1;
