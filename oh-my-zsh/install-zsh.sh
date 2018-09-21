#!/bin/bash

script_dir=$(dirname $0)
echo "DEBUG: script_dir=${script_dir}"

# mkdir -p ~/.oh-my-zsh/custom/plugins/cf-api-status
# mkdir -p ~/.oh-my-zsh/custom/themes

echo cp ${script_dir}/cf-api-status.plugin.zsh ~/.oh-my-zsh/custom/plugins/cf-api-status/cf-api-status.plugin.zsh
echo cp ${script_dir}/bira-cf.zsh-theme  ~/.oh-my-zsh/custom/themes/bira-cf.zsh-theme

echo ""
echo "*****************************************************************"
echo "** Cloud Foundry has been added to your oh-my-zsh installation **"
echo "**                                                             **"
echo "** Please edit your ~/.zshrc as follows                        **"
echo "**   [update] ZSH_THEME=\"bira-cf\"                            **"
echo "**   [insert] cf-api-status into plugins=()                    **"
echo "**                                                             **"
echo "*****************************************************************"
echo ""
echo ""
