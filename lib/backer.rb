class Backer

    attr_accessor :name

    def initialize(name)
        @name = name
        @backed_projects = []
    end

    def back_project(project)
        backed_projects << project
        project.backers << self
        ProjectBacker.new(project, self)
    end

    def backed_projects
        project_backers = ProjectBacker.all.select do |pb|
          pb.backer == self
        end
        project_backers.map do |pb|
          pb.project
        end
      end


end

