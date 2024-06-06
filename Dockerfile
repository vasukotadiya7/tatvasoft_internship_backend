# Use the official .NET runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5050

# Copy the publish folder to the container
COPY ./publish .

# Define the entry point for the application
ENTRYPOINT ["dotnet", "Web_API.dll"]
