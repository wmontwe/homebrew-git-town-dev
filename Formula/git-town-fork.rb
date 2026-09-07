class GitTownFork < Formula                                                               
  desc "Git Town fork"                                                                    
  homepage "https://github.com/wmontwe/git-town"                                          
  head "https://github.com/wmontwe/git-town.git", branch: "fork-stack"                    
                                                                                             
  depends_on "go" => :build                                                               
                                                                                             
  def install                                                                             
    ldflags = [                                                                           
      "-s", "-w",                                                                         
      "-X github.com/git-town/git-town/v24/internal/cmd.version=-dev",                    
    ].join(" ")                                                                           
                                                                                             
    system "go", "build",                                                                 
      "-ldflags", ldflags,                                                                
      "-o", bin/"git-town",                                                               
      "."                                                                                 
  end                                                                                     
                                                                                             
  test do                                                                                 
     system bin/"git-town", "--version"                                                    
  end                                                                                     
end
