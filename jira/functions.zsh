# Customizing jira cli with own config path from env
function jira() {
	if [ -n "$JIRA_CONFIG_PATH" ]; then
		$(brew --prefix)/bin/jira -c "$JIRA_CONFIG_PATH" "$@"
	else
		$(brew --prefix)/bin/jira "$@"
	fi
}

function jira_my_issues() {
	jira issue list -a "$(jira me)" "$@"
}

function jira_my_active_issues() {
	jira_my_issues -s "~${JIRA_STATUS_DONE:-Done}" "$@"
}

function jira_git_issue() {
	git rev-parse --abbrev-ref HEAD | grep -oE '[A-Z]+-[0-9]+'
}

function jira_current_issue() {
	jira issue view "$(jira_git_issue)" "$@"
}

function jira_start_issue() {
	set -e
	git fetch origin main:main
	git switch -c "$1" main

	# if git fails, those will not exectue
	jira issue assign "$1" "$(jira me)"
	jira issue move "$1" "${JIRA_STATUS_INPROGRESS:-In progress}"
}

function jira_complete_issue() {
	jira issues move "$1" "${JIRA_COMPLETED_STATUS:-Done}"
}

function jira_move_current_issue() {
	jira issues move "$(jira_git_issue)" "$@"
}

function jira_complete_current_issue() {
	jira_complete_issue "$(jira_git_issue)"
}
