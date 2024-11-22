@echo off
setlocal enabledelayedexpansion

set CONDA_ENV=%1
if "%CONDA_ENV%"=="" (
    echo Please provide a conda environment name
    exit /b 1
)

echo Creating Conda Environment: %CONDA_ENV%
call conda create -n %CONDA_ENV% python=3.10.0 -y
echo Conda Environment Created Successfully

echo Activating Conda Environment: %CONDA_ENV%
call conda activate %CONDA_ENV%
echo Conda Environment Activated

echo Installing CUDA Toolkit
call conda install -c nvidia cuda-toolkit -y
echo CUDA Toolkit Installed Successfully

echo Activating Conda Environment: %CONDA_ENV%
call conda activate %CONDA_ENV%
echo Conda Environment Activated

echo Updating pip to latest version
python -m pip install --upgrade pip
echo Pip Updated Successfully

echo Activating Conda Environment: %CONDA_ENV%
call conda activate %CONDA_ENV%
echo Conda Environment Activated

echo Installing xformers
call pip install -U xformers==0.0.27.post2 --index-url https://download.pytorch.org/whl/cu121
echo Xformers Installed Successfully

echo Activating Conda Environment: %CONDA_ENV%
call conda activate %CONDA_ENV%
echo Conda Environment Activated

echo Installing project in editable mode
call pip install -e .
echo Project Installed Successfully

echo Activating Conda Environment: %CONDA_ENV%
call conda activate %CONDA_ENV%
echo Conda Environment Activated

echo Installing triton from wheel
pip install triton-3.0.0-cp310-cp310-win_amd64.whl
echo Installing triton complete

echo Environment Setup Complete!