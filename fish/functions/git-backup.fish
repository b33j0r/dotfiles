function git-backup
    set uuid (python  -c 'import uuid; print(str(uuid.uuid4())[:8])')
    
    set project_dir (git rev-parse --show-toplevel)
    set commit (git rev-parse HEAD)
    set branch (git rev-parse --abbrev-ref HEAD)
    
    set backup_branch gitf-$uuid-work-backup
    set backup_dir .backup-git/$uuid
    set backup_commit_file $backup_dir/HEAD
    set backup_branch_file $backup_dir/BRANCH
    
    # Make sure we CAN backup
    mkdir -p $backup_dir
    echo "/*" > $backup_dir/.gitignore
    
    echo (git status $project_dir) > $backup_dir/git_status_start.txt
    echo $commit > $backup_commit_file
    echo $branch > $backup_branch_file
    
    # Let's go!
    
    git stash
    
    git checkout -b $backup_branch
    git stash apply
    git add 
    git commit -m "#gitf-$uuid-work-backup commit"
    
    echo $backup_branch > $backup_dir/BACKUP_BRANCH
    
    git checkout "$base_branch"; or git checkout "$base_commit"
    
    git stash pop
    
    echo (git status $project_dir) > $backup_dir/git_status_end.txt
    # set end_tree (tree -a $project_dir)
    # echo "$end_tree" > $backup_dir/end_tree
    
end
