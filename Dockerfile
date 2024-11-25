FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["CIPlatfromWebAPI/Web_API.csproj", "CIPlatfromWebAPI/"]
RUN dotnet restore "CIPlatfromWebAPI/Web_API.csproj"
COPY . .
WORKDIR "/src/CIPlatfromWebAPI"
RUN dotnet build "Web_API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Web_API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Web_API.dll"]
