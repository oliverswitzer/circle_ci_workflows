require 'circle_cli/version'
require 'circle_cli/ui/cli'
require 'circle_cli/gateways/commit_gateway'
require 'circle_cli/core/entities/commit'
require 'circle_cli/core/entities/job'
require 'circle_cli/core/use_cases/fetch_latest_commit_workflow'
require 'circle_cli/core/use_cases/watch_latest_commit_workflow'
require 'circle_cli/core/use_cases/open_branch_workflow'

module CircleCli
  class App
    def initialize
      # Dependency Inversion principle in action (https://en.wikipedia.org/wiki/Dependency_inversion_principle)
      #
      # --> Our core "Business Logic Objects" i.e FetchLatestCommitWorkflow, WatchLatestCommitWorkflow and
      # OpenBranchWorkflow have no explicit dependency on the UI rendering or how data is retrieved because the objects
      # that are responsible for those things are injected as configuration at the application layer. Another
      # benefit of doing this injection is that testing becomes much easier.

      @cli = UI::CLI.new
      @commit_gateway = Gateways::CommitGateway.new(
        owner: @cli.get_github_repo_owner,
        github_repo: @cli.get_github_repo
      )
      @fetch_latest_commit_workflow = Core::UseCases::FetchLatestCommitWorkflow.new(cli: @cli, commit_gateway: @commit_gateway)
      @watch_latest_commit_workflow = Core::UseCases::WatchLatestCommitWorkflow.new(cli: @cli, commit_gateway: @commit_gateway)
      @open_branch_workflow = Core::UseCases::OpenBranchWorkflow.new(cli: @cli)
    end

    def run
      case @cli.get_user_input
      when UI::CLI::InputOptions::STATUS
        @fetch_latest_commit_workflow.execute(branch: @cli.get_current_branch)
      when UI::CLI::InputOptions::WATCH
        @watch_latest_commit_workflow.execute(branch: @cli.get_current_branch)
      when UI::CLI::InputOptions::OPEN
        @open_branch_workflow.execute(branch: @cli.get_current_branch)
      end
    end
  end
end
