import os

def create_single_file(file_name):
    # Get the current directory path
    current_dir = os.getcwd()
    
    # Initialize an empty string to hold the file contents
    file_contents = ''
    
    # Loop through all subdirectories and files
    for root, dirs, files in os.walk(current_dir):
        for file in files:
            # Exclude files ending in ".freezed.dart" or ".g.dart"
            if not file.endswith(('.freezed.dart', '.g.dart')):
                # Get the file path relative to the current working directory and read its contents
                file_path = os.path.relpath(os.path.join(root, file), current_dir)
                with open(os.path.join(root, file), 'r', encoding='windows-1252') as f:
                    contents = f.read()
                
                # Add the file path and contents to the output string
                file_contents += f"\n{file_path}\n\n{contents}\n"
    
    # Write the output string to the specified file
    with open(file_name, 'w') as f:
        f.write(file_contents)

create_single_file('output.txt')